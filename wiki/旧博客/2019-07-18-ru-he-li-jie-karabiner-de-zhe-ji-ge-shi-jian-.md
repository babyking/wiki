---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: karabiner的alone,held_down,delayed_action这几个事件
date: 2019-07-18 16:20
category: 软件
tags: [karabiner,键盘]
---



```json
{
    "parameters": {      
      "basic.to_delayed_action_delay_milliseconds": 250, //主要用于double `key`的设置,在设定的时间内双击可以触发事件,需要condition及变量的配合.
      "basic.to_if_alone_timeout_milliseconds": 200,  //一般与held_down的时间设置一至
      "basic.to_if_held_down_threshold_milliseconds": 200,
      "mouse_motion_to_scroll.speed": 100
    },
    "from": {
      "key_code": "o"
    },
  	"to":{     //to总是被执行
      "key_code": "x"
    }
    "to_delayed_action": {  //超过delay设置的时间会被执行,是执行invoked还是canceled,要看上下文按键情况
      "to_if_invoked": [  //如果"o"键按下后250毫秒内没有其他键按下,那么就会执行invoked,输出"r"
        {
          "key_code": "r"
        }        
      ],
      "to_if_canceled": [ 
        //如果"o"键按下后250毫秒内有其他按键按下,那么就会执行canceled,输出"s",同时会终止invoked的执行
        //这里有一个非常巧妙有用的用法.就是取消invoked,只设置canceled. 这样可以解决有些打字特别快的情况下,两个键几乎同时按下的情况下丢键的问题. 
        //比如 a和b几乎同时按下,产生 
        //a_keydown
        //b_keydown
        //b_keyup
        //a_keyup  
        //有些软件因为a键的keydown,keyup事件不完整就会将a_keyup丢掉,导致丢键
        //这种情况下cancled事件设置输出的key_code与from一致,就可以此问题. 虽然delay设计的初衷是为了实现 双击修饰键和像emacs中的二次快捷组合键C-x,c这样的场景,但是也可以解决快速输入引起的丢键问题. 这种情况下时间设置to_delayed_action_delay_milliseconds没有什么特殊要求. 不知道作者在设计这个特性的时候有没有考虑到这个功能:)
        {
          "key_code": "s"
        }
      ]
    },
    "to_if_alone": [ //在alone设置的200毫秒内完成单击触发此事件
      {
        "halt": true,
        "key_code": "p"
      }
    ],
    "to_if_held_down": [  //超过held_down设置的时间触发此事件,用于一个键的长按
      {
        "key_code": "q",
        "repeat": false
      }
    ],
    "type": "basic"
} 
```

以上事件并不会全部使用.不过通过上述示例,可以看到他们的触发顺序

1. from  
2. to
3. alone //如果满足单击时间条件(一般在多少毫秒内), 与held_down是互斥的
4. held_down //如果满足条件 . 与alone是互斥的. **一般将alone和held_down的时间设置为相同.**
5. delay_action
   1. invoked  // 在delay设置的时间内没有其他键按下执行. 
   2. canceled //在delay设置的时间内如果有其他键按下触发此事件,并取消invoked的事件.



一般来说 to和held_down并用.   alone和_held_down并用,看起来他们好像都是完成单击和长按,但是略有不同.前者可以保证单击的最快响应.

如,空格键映射至shift键,单击输出空格 要求shift的键的响应是第一位的.因为在事件流中to也是靠前的.

所以尽管后者alone和_held_down也可以实现类似功能,但是会有缺陷,因为alone和held_down是互斥关系,快速输入的情况下,要求shift键的组合输入响应时间可能要小于"单击",但实际上held_down的时间一定是会比alone要长的.

下面是正确的更好的配置

```json
{
  "description": "长按 空格键 => Shfit,单击映射至空格键",
  "manipulators": [
    {
      "from": {
        "key_code": "spacebar",
        "modifiers": {
          "optional": [
            "any"
          ]
        }
      },
      "to": [
        {
          "key_code": "left_shift"
        }
      ],
      "to_if_alone": [
        {
          "key_code": "spacebar"
        }
      ],
      "type": "basic"
    }
  ]
},
```

上面的这个配置在执行的过程中其实会多输出shift,但是shift的前置输出对结果无影响.

![image-20200421213052561](../assets/blog/image-20200421213052561.png)





其他的如普通键映射成cmd这样的修饰键,情况恰恰相反,要求普通的键的输出一定是要优先的,如果只使用 to和alone 这样配置的话在临界条件下是有一些问题的.**因为to是第一响应的,如果配成修饰键,在前面说的快速输入的情况下会有机率跟其他键组合成一个"功能组合键".**并且对于组合键的响应时间的要求是低于普通键的输入的.

其实软件预置的一些vi的配置都有这样的问题

```json
{
  "from": {
    "key_code": "spacebar",
    "modifiers": {
      "optional": [
        "any"
      ]
    }
  },
  "to": [
    {
      "key_code": "left_command" //这里如果这样设置的话会有问题.
    }
  ],
  "to_if_alone": [
    {
      "key_code": "spacebar"
    }
  ],
  "type": "basic"
}
```

更好的方式应该是这样配置,这样才能满足输入按键是第一响应,组合键是第二响应,而且在事件的响应顺序上也是符合的. 

```json
{
  "from": {
    "key_code": "spacebar",
    "modifiers": {
      "optional": [
        "any"
      ]
    }
  },
	"to_delayed_action": {
    "to_if_canceled": [
      {
        "key_code": "spacebar" //修正快速键入的键的丢失
      }
    ]
  },
  "to_if_alone": [
    {
      "key_code": "spacebar"
    }
  ],
  "to_if_held_down": [    
    {
      "key_code": "left_command", 
      "repeat": false
    }
  ],

  "type": "basic"
}
```





## 

## 下面的内容理解有误,请不要参考,以前面的为准.



在折腾karabiner的时候, `to_if_alone` `to_if_held_down` `to_delayed_action` 这几个事件之间的关系很不容易理解,特别是这几个需要配合的时候.

尝试做个试验理解一下.

```json
{
  "description": "test",
  "manipulators": [
    {
      "parameters": {
        "basic.to_delayed_action_delay_milliseconds": 300,
        "basic.to_if_alone_timeout_milliseconds": 200,
        "basic.to_if_held_down_threshold_milliseconds": 200
      },
      "from": {
        "key_code": "t",
        "modifiers": {
          "optional": [
            "any"
          ]
        }
      },
      "to_delayed_action": {
        "to_if_canceled": [
          {
            "key_code": "c"
          }
        ],
        "to_if_invoked": [
          {
            "key_code": "i"
          }
        ]
      },
      "to_if_alone": [
        {
          "halt": true,
          "key_code": "a"
        }
      ],
      "to_if_held_down": [
        {
          "key_code": "h",
          "repeat": false
        }
      ],
      "type": "basic"
    }
  ]
}
```

上面的配置参数经过多次实验,终于明白这几个事件的机制了.

首先了解这3个参数的功能:



"parameters": {

  			"basic.to_delayed_action_delay_milliseconds": 300,   

​        	   **// 按下一个键超过300毫秒触发 to_delayed_action事件,如果在300毫秒之内,有另外一个键的事件发性,则会触发其下的 to_if_canceled 事件,同时后面不会处理与to_if_canceled同级的to_if_invoked事件.**



  			"basic.to_if_alone_timeout_milliseconds": 200,    

  			**// 一个键按下释放在200毫秒内完成的话,触发 to_if_alone 事件**

  			

  			"basic.to_if_held_down_threshold_milliseconds": 200    

  			**//按下一个键超过200毫秒触发 to_if_held_down事件**         



}




这几个事件独立使用很简单,但是经过组合可以实现很酷的键盘定义.



比如,需要对T键做如下功能实现:

1. 正常的单击输出t
2. 长按t输出⌘

我们不加思索,就可以写个配置

```json
{
  "description": "test",
  "manipulators": [
    {
      "from": {
        "key_code": "t",
        "modifiers": {
          "optional": [
            "any"
          ]
        }
      },
      "to": [
        {
          "key_code": "t"
        }
      ],      
      "to_if_held_down": [
        {
          "key_code": "left_command",
          "repeat": false
        }
      ],
      "type": "basic"
    }
  ]
}
```



但是上面的配置可以运行,但是会有2个问题

1. 当单击t时,key_down与key_up事件间的**时间差**处于`basic.to_if_alone_timeout_milliseconds`定义的临界点时,会顺序输出left_command和t,当然对于这个场景独立的输出command没有功能影响,但如果是其他功能组合键就会有问题了.

2. 当打字速度快的时候,当`t`的key_up事件还没发生的时候,另外一个键的key_down发生时,t的这个输入就会丢失.

![Snip20190718_2](../assets/blog/Snip20190718_2.png)



所以karabiner给出了 to_delayed_action > to_if_canceld 这样的事件有于补偿修正事件处于临界点的异常情况.



```json
{
  "description": "test",
  "manipulators": [
    {
      "parameters": {
        "basic.to_delayed_action_delay_milliseconds": 300,
        "basic.to_if_alone_timeout_milliseconds": 200,
        "basic.to_if_held_down_threshold_milliseconds": 200
      },
      "from": {
        "key_code": "t",
        "modifiers": {
          "optional": [
            "any"
          ]
        }
      },
      "to_delayed_action": { //超过300毫秒触发此事件块中所定义的事件
        "to_if_canceled": [  //在300毫秒内如果有其他键的事件发生,则触发此事件,此事件中的key_code定义为原始key,作为补偿修正,同时 to_if_invoked的事件不会再触发
          {
            "key_code": "t"
          }
        ]
        //,"to_if_invoked":[  //如果to_if_canceled 未被触发,超出300毫秒后触发此事件.
        //  {}
        //]
      },
      "to_if_alone": [
        {
          "halt": true,
          "key_code": "t"
        }
      ],
      "to_if_held_down": [
        {
          "key_code": "left_command",
          "repeat": false
        }
      ],
      "type": "basic"
    }
  ]
}
```



完美!

```json
"parameters": {
        "basic.to_delayed_action_delay_milliseconds": 300,
        "basic.to_if_alone_timeout_milliseconds": 200,
        "basic.to_if_held_down_threshold_milliseconds": 200
      }
```

反复测试后,以上几个参数设置为上面的值在我的机器表现最佳, 一般alone和held_down的时间设置为相同,delay_action要设置的比其他两个稍大一些.
~
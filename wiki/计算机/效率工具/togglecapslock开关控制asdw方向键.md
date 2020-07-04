### toggle capslock开关,控制asdw方向键

```json
{
    "description": "WASD arrow Keys toggled by Capslock",
    "manipulators": [
        {
            "conditions": [
                {
                    "name": "wasd_arrow_keys_mode",
                    "type": "variable_unless",
                    "value": 1
                }
            ],
            "from": {
                "key_code": "caps_lock",
                "modifiers": {
                    "optional": [
                        "any"
                    ]
                }
            },
            "to": [
                {
                    "set_variable": {
                        "name": "wasd_arrow_keys_mode",
                        "value": 1
                    }
                }
            ],
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "name": "wasd_arrow_keys_mode",
                    "type": "variable_if",
                    "value": 1
                }
            ],
            "from": {
                "key_code": "caps_lock",
                "modifiers": {
                    "optional": [
                        "any"
                    ]
                }
            },
            "to": [
                {
                    "set_variable": {
                        "name": "wasd_arrow_keys_mode",
                        "value":  0
                    }
                }
            ],
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "name": "wasd_arrow_keys_mode",
                    "type": "variable_if",
                    "value": 1
                }
            ],
            "from": {
                "key_code": "a",
                "modifiers": {
                    "optional": [
                        "any"
                    ]
                }
            },
            "to": [
                {
                    "key_code": "left_arrow"
                }
            ],
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "name": "wasd_arrow_keys_mode",
                    "type": "variable_if",
                    "value": 1
                }
            ],
            "from": {
                "key_code": "s",
                "modifiers": {
                    "optional": [
                        "any"
                    ]
                }
            },
            "to": [
                {
                    "key_code": "down_arrow"
                }
            ],
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "name": "wasd_arrow_keys_mode",
                    "type": "variable_if",
                    "value": 1
                }
            ],
            "from": {
                "key_code": "w",
                "modifiers": {
                    "optional": [
                        "any"
                    ]
                }
            },
            "to": [
                {
                    "key_code": "up_arrow"
                }
            ],
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "name": "wasd_arrow_keys_mode",
                    "type": "variable_if",
                    "value": 1
                }
            ],
            "from": {
                "key_code": "d",
                "modifiers": {
                    "optional": [
                        "any"
                    ]
                }
            },
            "to": [
                {
                    "key_code": "right_arrow"
                }
            ],
            "type": "basic"
        }
    ]
}
```


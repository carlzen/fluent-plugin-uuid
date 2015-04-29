# fluent-plugin-add, a plugin for [Fluentd](http://fluentd.org)


## Installation

    gem specific_install https://github.com/j-o-s-h/fluent-plugin-uuid.git

## Configration

<match example.*>
  type uuid
  add_tag_prefix testing
  uuid_len 5
  uuid_key_name guidkey
</match>


### Assuming following inputs are coming:
    test.aa: {"json":"dayo"}
### then output bocomes as belows
    debug.test.aa: {"json":"dayo", "guidkey":"dkf73k" }

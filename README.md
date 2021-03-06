zookeepr Cookbook
=================
Cookbook for my branch of zookeepr

https://github.com/flosokaks/zookeepr


Requirements
------------

#### OS

* Debian 8.

#### packages

- `vagrant` - for testing

Attributes
----------

* debug

#### zookeepr::debug

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['zookeepr'][debug']</tt></td>
    <td>Boolean</td>
    <td>whether to debug</td>
    <td><tt>false</tt></td>
  </tr>
</table>

Usage
-----
#### zookeepr::default

Include `zookeepr` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[zookeepr]"
  ]
}
```

Testing
-------

    rspec spec/first_spec.rb

# Test the cookbook locally 

in the dir chef/cookbooks/zookeepr

    bundle exec  chef-apply recipes/default.rb  -l debug

# setup berks

in chef/cookbooks/zookeepr

    bundle exec berks init .

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
GNU Public License 3.0

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.
   
Authors:

James Michael DuPont (h4ck3rm1k3) <jamesmikedupont@gmail.com>

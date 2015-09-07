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

e.g.
#### zookeepr::default
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
Authors:

James Michael DuPont <h4ck3rm1k3>

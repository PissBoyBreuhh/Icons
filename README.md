# Icons
### A mod made by Breuhh, Jogla and Aura2247

Icons introduces small images that are placed next to text in descriptions of cards. Like how when they mention Characters in Super Mario games. 

![The description of the Joker 'Flower Pot' with the icons](./assets/misc/flower_pot_example.png)

# API Documentation: Icons.Icon
* **Required Parameters**:
  * `key`
* **Optional Parameters** *(defaults)*:
  * `atlas = "Joker", pos = {x = 0, y = 0}`
  * `targets = {['en-us'] = { {values = {}, apply = Icons.default_apply['en-us'] } }}`
    * targets is a dictionary in which every is the key of a language. It contains an array of tables containing `values`, an array of strings to match and an `apply` function to apply icons.

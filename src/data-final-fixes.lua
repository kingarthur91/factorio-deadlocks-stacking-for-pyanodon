local shared = require("migrations.shared")
require("prototypes.util")

if deadlock then
  create_all(shared.STACKABLES, shared.STACKING_PREFIX, deadlock.add_stack, true)
end

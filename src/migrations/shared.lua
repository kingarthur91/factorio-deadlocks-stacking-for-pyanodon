local shared = "shared"

return {
    STACKABLES = {
        pycoalprocessing = require(shared .. ".pycoalprocessing"),
        pyhightech = require(shared .. ".pyhightech"),
        pyrawores = require(shared .. ".pyrawores"),
        pyfusionenergy = require(shared .. ".pyfusionenergy"),
        pypetroleumhandling = require(shared .. ".pypetroleumhandling"),
        pyalienlife = require(shared .. ".pyalienlife")
    },
    STACKING_PREFIX = "deadlock-stacking-",
    CRATING_PREFIX = "deadlock-stacking-"
}

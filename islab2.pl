% Define types and categories
kind_of(smartphone, mobile_device).
kind_of(tablet, mobile_device).
kind_of(mobile_device, computing_device).
kind_of(laptop, computing_device).
kind_of(desktop, computing_device).
kind_of(computing_device, electronic_device).
kind_of(smartwatch, wearable_device).
kind_of(fitness_tracker, wearable_device).
kind_of(wearable_device, electronic_device).
kind_of(electronic_device, gadget).
kind_of(router, networking_device).
kind_of(switch, networking_device).
kind_of(networking_device, hardware).
kind_of(printer, peripheral_device).
kind_of(scanner, peripheral_device).
kind_of(peripheral_device, hardware).
kind_of(hardware, gadget).
kind_of(software_application, software).
kind_of(operating_system, software).
kind_of(software, digital_product).
kind_of(digital_product, product).

% Define components and parts
component_of(screen, smartphone).
component_of(battery, mobile_device).
component_of(processor, computing_device).
component_of(memory_chip, computing_device).
component_of(camera_module, smartphone).
component_of(antenna, router).
component_of(port, networking_device).
component_of(sensor, wearable_device).
component_of(keyboard, laptop).
component_of(mouse, desktop).
component_of(display_panel, television).
component_of(storage_drive, computing_device).
component_of(circuit_board, electronic_device).
component_of(firmware, hardware).
component_of(software_driver, peripheral_device).

% Define relationships and dependencies
produces(smartphone, communication).
produces(router, connectivity).
produces(printer, printed_document).
produces(scanner, digital_copy).
produces(software_application, data_output).
needs(mobile_device, battery_power).
needs(computing_device, operating_system).
needs(router, internet_connection).
needs(printer, ink_cartridge).
needs(scanner, driver_software).
interacts_with(smartphone, smartwatch).
interacts_with(laptop, printer).
depends_on(software_application, operating_system).
depends_on(fitness_tracker, smartphone).
depends_on(networking_device, firmware_update).

% Define chain rules for causality, requirements, interactions, and dependencies
effect_chain(X, Z) :- produces(X, Z).
effect_chain(X, Z) :- produces(X, Y), effect_chain(Y, Z).

requirement_chain(X, Z) :- needs(X, Z).
requirement_chain(X, Z) :- needs(X, Y), requirement_chain(Y, Z).

interaction_sequence(X, Z) :- interacts_with(X, Z).
interaction_sequence(X, Z) :- interacts_with(X, Y), interaction_sequence(Y, Z).

dependency_sequence(X, Z) :- depends_on(X, Z).
dependency_sequence(X, Z) :- depends_on(X, Y), dependency_sequence(Y, Z).

% Define inheritance and component chains
inherits_from(X, Z) :- kind_of(X, Z).
inherits_from(X, Z) :- kind_of(X, Y), inherits_from(Y, Z).

component_chain(X, Z) :- component_of(X, Z).
component_chain(X, Z) :- component_of(X, Y), component_chain(Y, Z).
component_chain(X, Z) :- kind_of(X, Y), component_of(Y, Z).

% Define inheritance restrictions and multiple inheritance
inheritance_restricted(X, Z) :- component_chain(X, Y), kind_of(Y, Z).

multiple_inheritance(X, [P1, P2]) :- kind_of(X, P1), kind_of(X, P2).
multiple_inheritance(X, [P1, P2, P3]) :- kind_of(X, P1), kind_of(X, P2), kind_of(X, P3).

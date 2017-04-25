:- module(pokemonGen3, [gen3/1]).

gen3(normal).
gen3(fire).
gen3(water).
gen3(electric).
gen3(grass).
gen3(ice).
gen3(fighting).
gen3(poison).
gen3(ground).
gen3(flying).
gen3(psychic).
gen3(bug).
gen3(rock).
gen3(ghost).
gen3(dragon).
gen3(dark).
gen3(steel).


% These are the double-type pokemon types that exist in gen3. This
% listing is an optimization so that we don't try to list/compute
% types for pokemon that don't yet exist.
gen3([bug, fighting]).
gen3([bug, flying]).
gen3([bug, ghost]).
gen3([bug, grass]).
gen3([bug, ground]).
gen3([bug, poison]).
gen3([bug, rock]).
gen3([bug, steel]).
gen3([bug, water]).
gen3([dark, fire]).
gen3([dark, flying]).
gen3([dark, ice]).
gen3([dragon, flying]).
gen3([dragon, psychic]).
gen3([electric, flying]).
gen3([electric, steel]).
gen3([fire, flying]).
gen3([fire, fighting]).
gen3([fire, ground]).
gen3([fire, rock]).
gen3([fighting, psychic]).
gen3([ghost, poison]).
gen3([grass, dark]).
gen3([grass, fighting]).
gen3([grass, flying]).
gen3([grass, poison]).
gen3([grass, psychic]).
gen3([ground, dragon]).
gen3([ground, flying]).
gen3([ground, psychic]).
gen3([ground, rock]).
gen3([ice, flying]).
gen3([ice, ground]).
gen3([ice, psychic]).
gen3([ice, water]).
gen3([normal, flying]).
gen3([normal, psychic]).
gen3([poison, ground]).
gen3([poison, flying]).
gen3([psychic, grass]).
gen3([psychic, flying]).
gen3([rock, dark]).
gen3([rock, flying]).
gen3([rock, bug]).
gen3([rock, grass]).
gen3([rock, ground]).
gen3([rock, psychic]).
gen3([rock, water]).
gen3([steel, ground]).
gen3([steel, flying]).
gen3([steel, rock]).
gen3([steel, psychic]).
gen3([water, dark]).
gen3([water, dragon]).
gen3([water, electric]).
gen3([water, fighting]).
gen3([water, flying]).
gen3([water, grass]).
gen3([water, ground]).
gen3([water, ice]).
gen3([water, poison]).
gen3([water, psychic]).
gen3([water, rock]).

% Gen3 does not change the Gen2 typechart, according to Bulbapedia.
% http://bulbapedia.bulbagarden.net/w/index.php?title=Type/Type_chart&oldid=2564741

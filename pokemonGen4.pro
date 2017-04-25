:- module(pokemonGen4, [gen4/1]).

gen4(normal).
gen4(fire).
gen4(water).
gen4(electric).
gen4(grass).
gen4(ice).
gen4(fighting).
gen4(poison).
gen4(ground).
gen4(flying).
gen4(psychic).
gen4(bug).
gen4(rock).
gen4(ghost).
gen4(dragon).
gen4(dark).
gen4(steel).


% These are the double-type pokemon types that exist in gen4. This
% listing is an optimization so that we don't try to list/compute
% types for pokemon that don't yet exist.
gen4([bug, fighting]).
gen4([bug, flying]).
gen4([bug, ghost]).
gen4([bug, grass]).
gen4([bug, ground]).
gen4([bug, poison]).
gen4([bug, rock]).
gen4([bug, steel]).
gen4([bug, water]).
gen4([dark, fire]).
gen4([dark, flying]).
gen4([dark, ice]).
gen4([dragon, flying]).
gen4([dragon, ground]).
gen4([dragon, psychic]).
gen4([electric, flying]).
gen4([electric, ghost]).
gen4([electric, steel]).
gen4([fire, flying]).
gen4([fire, fighting]).
gen4([fire, ground]).
gen4([fire, rock]).
gen4([fire, steel]).
gen4([fighting, psychic]).
gen4([fighting, steel]).
gen4([ghost, dark]).
gen4([ghost, dragon]).
gen4([ghost, flying]).
gen4([ghost, poison]).
gen4([grass, dark]).
gen4([grass, fighting]).
gen4([grass, flying]).
gen4([grass, ground]).
gen4([grass, ice]).
gen4([grass, poison]).
gen4([grass, psychic]).
gen4([ground, dragon]).
gen4([ground, flying]).
gen4([ground, psychic]).
gen4([ground, rock]).
gen4([ice, flying]).
gen4([ice, ghost]).
gen4([ice, ground]).
gen4([ice, psychic]).
gen4([ice, water]).
gen4([normal, flying]).
gen4([normal, psychic]).
gen4([normal, water]).
gen4([poison, bug]).
gen4([poison, dark]).
gen4([poison, ground]).
gen4([poison, fighting]).
gen4([poison, flying]).
gen4([psychic, grass]).
gen4([psychic, fighting]).
gen4([psychic, flying]).
gen4([rock, dark]).
gen4([rock, flying]).
gen4([rock, bug]).
gen4([rock, grass]).
gen4([rock, ground]).
gen4([rock, psychic]).
gen4([rock, steel]).
gen4([rock, water]).
gen4([steel, dragon]).
gen4([steel, ground]).
gen4([steel, flying]).
gen4([steel, rock]).
gen4([steel, psychic]).
gen4([water, dark]).
gen4([water, dragon]).
gen4([water, electric]).
gen4([water, fighting]).
gen4([water, flying]).
gen4([water, grass]).
gen4([water, ground]).
gen4([water, ice]).
gen4([water, poison]).
gen4([water, psychic]).
gen4([water, rock]).
gen4([water, steel]).

% gen4 does not change the Gen2 typechart, according to Bulbapedia.
% http://bulbapedia.bulbagarden.net/w/index.php?title=Type/Type_chart&oldid=2564741

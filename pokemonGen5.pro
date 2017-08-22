:- module(pokemonGen5, [gen5/1]).

gen5(normal).
gen5(fire).
gen5(water).
gen5(electric).
gen5(grass).
gen5(ice).
gen5(fighting).
gen5(poison).
gen5(ground).
gen5(flying).
gen5(psychic).
gen5(bug).
gen5(rock).
gen5(ghost).
gen5(dragon).
gen5(dark).
gen5(steel).

% These are the double-type pokemon types that exist in gen5. This
% listing is an optimization so that we don't try to list/compute
% types for pokemon that don't yet exist.
gen5([bug, electric]).
gen5([bug, fighting]).
gen5([bug, fire]).
gen5([bug, flying]).
gen5([bug, ghost]).
gen5([bug, grass]).
gen5([bug, ground]).
gen5([bug, poison]).
gen5([bug, rock]).
gen5([bug, steel]).
gen5([bug, water]).
gen5([dark, dragon]).
gen5([dark, fighting]).
gen5([dark, fire]).
gen5([dark, flying]).
gen5([dark, ghost]).
gen5([dark, ice]).
gen5([dark, steel]).
gen5([dragon, electric]).
gen5([dragon, fire]).
gen5([dragon, flying]).
gen5([dragon, ground]).
gen5([dragon, ice]).
gen5([dragon, psychic]).
gen5([electric, fire]).
gen5([electric, flying]).
gen5([electric, ghost]).
gen5([electric, grass]).
gen5([electric, ice]).
gen5([electric, steel]).
gen5([electric, water]).
gen5([fighting, psychic]).
gen5([fighting, steel]).
gen5([fire, fighting]).
gen5([fire, flying]).
gen5([fire, ground]).
gen5([fire, psychic]).
gen5([fire, rock]).
gen5([fire, steel]).
gen5([ghost, dark]).
gen5([ghost, dragon]).
gen5([ghost, fire]).
gen5([ghost, flying]).
gen5([ghost, poison]).
gen5([grass, dark]).
gen5([grass, fighting]).
gen5([grass, flying]).
gen5([grass, ground]).
gen5([grass, ice]).
gen5([grass, poison]).
gen5([grass, psychic]).
gen5([grass, steel]).
gen5([ground, dark]).
gen5([ground, dragon]).
gen5([ground, electric]).
gen5([ground, flying]).
gen5([ground, ghost]).
gen5([ground, psychic]).
gen5([ground, rock]).
gen5([ground, steel]).
gen5([ice, flying]).
gen5([ice, ghost]).
gen5([ice, ground]).
gen5([ice, psychic]).
gen5([ice, water]).
gen5([normal, fighting]).
gen5([normal, flying]).
gen5([normal, grass]).
gen5([normal, psychic]).
gen5([normal, water]).
gen5([poison, bug]).
gen5([poison, dark]).
gen5([poison, fighting]).
gen5([poison, flying]).
gen5([poison, ground]).
gen5([psychic, fighting]).
gen5([psychic, fire]).
gen5([psychic, flying]).
gen5([psychic, grass]).
gen5([rock, bug]).
gen5([rock, dark]).
gen5([rock, fighting]).
gen5([rock, flying]).
gen5([rock, grass]).
gen5([rock, ground]).
gen5([rock, psychic]).
gen5([rock, steel]).
gen5([rock, water]).
gen5([steel, dragon]).
gen5([steel, fighting]).
gen5([steel, flying]).
gen5([steel, ground]).
gen5([steel, psychic]).
gen5([steel, rock]).
gen5([water, dark]).
gen5([water, dragon]).
gen5([water, electric]).
gen5([water, fighting]).
gen5([water, flying]).
gen5([water, ghost]).
gen5([water, grass]).
gen5([water, ground]).
gen5([water, ice]).
gen5([water, poison]).
gen5([water, psychic]).
gen5([water, rock]).
gen5([water, steel]).

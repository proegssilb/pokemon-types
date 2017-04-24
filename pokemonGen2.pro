:- module(pokemonGen2, [gen2/1, strong2/2, useless2/2, weak2/2, neutral2/2]).
:- use_module(pokemonGen1).

gen2(normal).
gen2(fire).
gen2(water).
gen2(electric).
gen2(grass).
gen2(ice).
gen2(fighting).
gen2(poison).
gen2(ground).
gen2(flying).
gen2(psychic).
gen2(bug).
gen2(rock).
gen2(ghost).
gen2(dragon).
gen2(dark).
gen2(steel).


% These are the double-type pokemon types that exist in gen2. This
% listing is an optimization so that we don't try to list/compute
% types for pokemon that don't yet exist.
gen2([bug, flying]).
gen2([bug, grass]).
gen2([bug, poison]).
gen2([bug, rock]).
gen2([bug, steel]).
gen2([bug, fighting]).
gen2([dark, fire]).
gen2([dark, flying]).
gen2([dark, ice]).
gen2([dragon, flying]).
gen2([electric, flying]).
gen2([electric, steel]).
gen2([fire, flying]).
gen2([fire, rock]).
gen2([ghost, poison]).
gen2([grass, poison]).
gen2([grass, psychic]).
gen2([grass, flying]).
gen2([ground, rock]).
gen2([ground, flying]).
gen2([ice, psychic]).
gen2([ice, flying]).
gen2([ice, ground]).
gen2([normal, flying]).
gen2([normal, psychic]).
gen2([poison, ground]).
gen2([poison, flying]).
gen2([psychic, grass]).
gen2([psychic, flying]).
gen2([rock, dark]).
gen2([rock, flying]).
gen2([rock, ground]).
gen2([rock, water]).
gen2([steel, ground]).
gen2([steel, flying]).
gen2([water, dragon]).
gen2([water, ice]).
gen2([water, electric]).
gen2([water, fighting]).
gen2([water, flying]).
gen2([water, ground]).
gen2([water, poison]).
gen2([water, psychic]).
gen2([water, rock]).


% 'strong[A, B]' is read 'Attack Type A is strong against pokemon of type B'
% 'weak' and 'useless' are read similarly; weak => A does half-damage to
% B, useless => A does no damage to B.

% This segment only records the changes for Gen2. Use utils.pro to query.

weak2(bug, poison).
weak2(ice, fire).
weak2(steel, steel).
weak2(steel, fire).
weak2(steel, water).
weak2(steel, electric).
weak2(dark, fighting).
weak2(dark, steel).
weak2(dark, dark).
weak2(normal, steel).
weak2(flying, steel).
weak2(rock, steel).
weak2(bug, steel).
weak2(ghost, steel).
weak2(grass, steel).
weak2(psychic, steel).
weak2(ice, steel).
weak2(dragon, steel).
weak2(ghost, dark).

neutral2(poison, bug).

strong2(ghost, psychic).
strong2(steel, rock).
strong2(steel, ice).
strong2(dark, ghost).
strong2(dark, psychic).
strong2(fighting, steel).
strong2(ground, steel).
strong2(fire, steel).
strong2(fighting, dark).
strong2(bug, dark).

useless2(poison, steel).
useless2(psychic, dark).

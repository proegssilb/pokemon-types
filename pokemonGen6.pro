:- module(pokemonGen6, [gen6/1, neutral6/2, strong6/2, weak6/2]).

gen6(normal).
gen6(fire).
gen6(water).
gen6(electric).
gen6(grass).
gen6(ice).
gen6(fighting).
gen6(poison).
gen6(ground).
gen6(flying).
gen6(psychic).
gen6(bug).
gen6(rock).
gen6(ghost).
gen6(dragon).
gen6(dark).
gen6(steel).
gen6(fairy).

% These are the double-type pokemon types that exist in gen6. This
% listing is an optimization so that we don't try to list/compute
% types for pokemon that don't yet exist.
gen6([bug, electric]).
gen6([bug, fighting]).
gen6([bug, fire]).
gen6([bug, flying]).
gen6([bug, ghost]).
gen6([bug, grass]).
gen6([bug, ground]).
gen6([bug, poison]).
gen6([bug, rock]).
gen6([bug, steel]).
gen6([bug, water]).
gen6([dark, dragon]).
gen6([dark, fighting]).
gen6([dark, fire]).
gen6([dark, flying]).
gen6([dark, ghost]).
gen6([dark, ice]).
gen6([dark, psychic]).
gen6([dark, steel]).
gen6([dragon, electric]).
gen6([dragon, fairy]).
gen6([dragon, fire]).
gen6([dragon, flying]).
gen6([dragon, ground]).
gen6([dragon, ice]).
gen6([dragon, psychic]).
gen6([electric, dragon]).
gen6([electric, fairy]).
gen6([electric, fire]).
gen6([electric, flying]).
gen6([electric, ghost]).
gen6([electric, grass]).
gen6([electric, ice]).
gen6([electric, normal]).
gen6([electric, steel]).
gen6([electric, water]).
gen6([fairy, flying]).
gen6([fighting, dark]).
gen6([fighting, flying]).
gen6([fighting, psychic]).
gen6([fighting, steel]).
gen6([fire, dragon]).
gen6([fire, fighting]).
gen6([fire, flying]).
gen6([fire, ground]).
gen6([fire, normal]).
gen6([fire, psychic]).
gen6([fire, rock]).
gen6([fire, steel]).
gen6([fire, water]).
gen6([flying, dragon]).
gen6([ghost, dark]).
gen6([ghost, dragon]).
gen6([ghost, fire]).
gen6([ghost, flying]).
gen6([ghost, grass]).
gen6([ghost, poison]).
gen6([grass, dark]).
gen6([grass, dragon]).
gen6([grass, fairy]).
gen6([grass, fighting]).
gen6([grass, flying]).
gen6([grass, ground]).
gen6([grass, ice]).
gen6([grass, poison]).
gen6([grass, psychic]).
gen6([grass, steel]).
gen6([ground, dark]).
gen6([ground, dragon]).
gen6([ground, electric]).
gen6([ground, fire]).
gen6([ground, flying]).
gen6([ground, ghost]).
gen6([ground, psychic]).
gen6([ground, rock]).
gen6([ground, steel]).
gen6([ice, flying]).
gen6([ice, ghost]).
gen6([ice, ground]).
gen6([ice, psychic]).
gen6([ice, water]).
gen6([normal, fairy]).
gen6([normal, fighting]).
gen6([normal, flying]).
gen6([normal, grass]).
gen6([normal, ground]).
gen6([normal, psychic]).
gen6([normal, water]).
gen6([poison, bug]).
gen6([poison, dark]).
gen6([poison, dragon]).
gen6([poison, fighting]).
gen6([poison, flying]).
gen6([poison, ground]).
gen6([poison, water]).
gen6([psychic, dark]).
gen6([psychic, fairy]).
gen6([psychic, fighting]).
gen6([psychic, fire]).
gen6([psychic, flying]).
gen6([psychic, ghost]).
gen6([psychic, grass]).
gen6([rock, bug]).
gen6([rock, dark]).
gen6([rock, dragon]).
gen6([rock, fairy]).
gen6([rock, fighting]).
gen6([rock, flying]).
gen6([rock, grass]).
gen6([rock, ground]).
gen6([rock, ice]).
gen6([rock, psychic]).
gen6([rock, steel]).
gen6([rock, water]).
gen6([steel, dragon]).
gen6([steel, fairy]).
gen6([steel, fighting]).
gen6([steel, flying]).
gen6([steel, ghost]).
gen6([steel, ground]).
gen6([steel, psychic]).
gen6([steel, rock]).
gen6([water, dark]).
gen6([water, dragon]).
gen6([water, electric]).
gen6([water, fairy]).
gen6([water, fighting]).
gen6([water, flying]).
gen6([water, ghost]).
gen6([water, grass]).
gen6([water, ground]).
gen6([water, ice]).
gen6([water, poison]).
gen6([water, psychic]).
gen6([water, rock]).
gen6([water, steel]).


% 'strong[A, B]' is read 'Attack Type A is strong against pokemon of type B'
% 'weak' and 'useless' are read similarly; weak => A does half-damage to
% B, useless => A does no damage to B.

% This segment only records the changes for Gen6. Use utils.pro to query.

neutral6(ghost, steel).
neutral6(dark, steel).

strong6(fairy, fighting).
strong6(fairy, dragon).
strong6(fairy, dark).
strong6(poison, fairy).

weak6(fairy, poison).
weak6(fairy, steel).
weak6(fairy, fire).
weak6(fighting, fairy).

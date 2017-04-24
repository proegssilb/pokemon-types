:- module(pokemonGen1, [gen1/1, strong1/2, useless1/2, weak1/2]).

gen1(normal).
gen1(fire).
gen1(water).
gen1(electric).
gen1(grass).
gen1(ice).
gen1(fighting).
gen1(poison).
gen1(ground).
gen1(flying).
gen1(psychic).
gen1(bug).
gen1(rock).
gen1(ghost).
gen1(dragon).
% These are the double-type pokemon types that exist in Gen1. This
% listing is an optimization so that we don't try to list/compute
% types for pokemon that don't yet exist.
gen1([normal, flying]).
gen1([fire, flying]).
gen1([water, flying]).
gen1([grass, poison]).
gen1([grass, psychic]).
gen1([rock, flying]).
gen1([rock, ground]).
gen1([rock, water]).
gen1([bug, flying]).
gen1([bug, grass]).
gen1([bug, poison]).
gen1([poison, ground]).
gen1([poison, flying]).
gen1([ghost, poison]).
gen1([water, ice]).
gen1([water, fighting]).
gen1([water, poison]).
gen1([water, psychic]).
gen1([ice, psychic]).
gen1([ice, flying]).
gen1([electric, flying]).
gen1([electric, flying]).
gen1([dragon, flying]).


% 'strong[A, B]' is read 'Attack Type A is strong against pokemon of type B'
% 'weak' and 'useless' are read similarly; weak => A does half-damage to
% B, useless => A does no damage to B.

strong1(bug, grass).
strong1(bug, poison).
strong1(bug, psychic).
strong1(dragon, dragon).
strong1(electric, flying).
strong1(electric, water).
strong1(fighting, ice).
strong1(fighting, normal).
strong1(fighting, rock).
strong1(fire, bug).
strong1(fire, grass).
strong1(fire, ice).
strong1(flying, bug).
strong1(flying, fighting).
strong1(flying, grass).
strong1(ghost, ghost).
strong1(grass, ground).
strong1(grass, rock).
strong1(grass, water).
strong1(ground, electric).
strong1(ground, fire).
strong1(ground, poison).
strong1(ground, rock).
strong1(ice, dragon).
strong1(ice, flying).
strong1(ice, grass).
strong1(poison, bug).
strong1(poison, grass).
strong1(psychic, fighting).
strong1(psychic, poison).
strong1(rock, bug).
strong1(rock, fire).
strong1(rock, flying).
strong1(rock, ice).
strong1(water, fire).
strong1(water, ground).
strong1(water, rock).

useless1(electric, ground).
useless1(fighting, ghost).
useless1(ground, flying).
useless1(normal, ghost).

weak1(bug, fighting).
weak1(bug, fire).
weak1(bug, flying).
weak1(bug, ghost).
weak1(electric, dragon).
weak1(electric,electric).
weak1(electric, grass).
weak1(fighting, bug).
weak1(fighting, flying).
weak1(fighting, poison).
weak1(fighting, psychic).
weak1(fire, dragon).
weak1(fire, fire).
weak1(fire, rock).
weak1(fire, water).
weak1(flying, electric).
weak1(flying, rock).
weak1(grass, bug).
weak1(grass, dragon).
weak1(grass, fire).
weak1(grass, flying).
weak1(grass, grass).
weak1(grass, poison).
weak1(ground, bug).
weak1(ground, grass).
weak1(ice, ice).
weak1(ice, water).
weak1(normal, rock).
weak1(poison, ghost).
weak1(poison, ground).
weak1(poison, poison).
weak1(poison, rock).
weak1(psychic, psychic).
weak1(rock, fighting).
weak1(rock, ground).
weak1(water, dragon).
weak1(water, grass).
weak1(water, water).

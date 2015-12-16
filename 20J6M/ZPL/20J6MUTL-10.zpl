set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.4693, <2> 45.075, <3> 31.7727, <4> 31.5429, <5> 5.7031, <6> 47.66, <7> 6.1409, <8> 39.0159, <9> 13.7448, <10> 42.3612, <11> 8.482, <12> 14.8623, <13> 3.9937, <14> 32.7, <15> 5.2502, <16> 8.1761, <17> 2.3801, <18> 42.7577, <19> 4.2357, <20> 38.7262;
param workload[JOB] := <1> 34.4693, <2> 45.075, <3> 31.7727, <4> 31.5429, <5> 5.7031, <6> 47.66, <7> 6.1409, <8> 39.0159, <9> 13.7448, <10> 42.3612, <11> 8.482, <12> 14.8623, <13> 3.9937, <14> 32.7, <15> 5.2502, <16> 8.1761, <17> 2.3801, <18> 42.7577, <19> 4.2357, <20> 38.7262;
param capacity[MACHINE] := <1> 57.3812, <2> 57.3812, <3> 57.3812, <4> 57.3812, <5> 57.3812, <6> 57.3812;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;

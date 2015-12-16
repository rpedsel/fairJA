set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.4789, <2> 28.1333, <3> 15.0679, <4> 31.1218, <5> 10.2591, <6> 13.6448, <7> 36.8538, <8> 36.1508, <9> 46.8212, <10> 21.3396, <11> 0.0358, <12> 0.4903, <13> 46.038, <14> 47.4315, <15> 8.9262, <16> 33.2212, <17> 46.6014, <18> 42.4646, <19> 49.2393, <20> 17.2647;
param workload[JOB] := <1> 39.1728, <2> 7.6486, <3> 21.9286, <4> 48.2803, <5> 28.769, <6> 49.6571, <7> 46.5464, <8> 13.4617, <9> 21.2035, <10> 38.9427, <11> 37.7109, <12> 3.1068, <13> 3.9199, <14> 19.4337, <15> 7.3839, <16> 46.7591, <17> 6.8704, <18> 36.363, <19> 2.7621, <20> 22.1802;
param capacity[MACHINE] := <1> 62.7626, <2> 62.7626, <3> 62.7626, <4> 62.7626, <5> 62.7626, <6> 62.7626;

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

set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.0791, <2> 24.8607, <3> 25.5264, <4> 25.6361, <5> 28.2851, <6> 28.1561, <7> 29.795, <8> 16.1869, <9> 21.0643, <10> 29.5199, <11> 39.6312, <12> 20.2574, <13> 32.4554, <14> 26.985, <15> 24.3314, <16> 31.1131, <17> 24.4717, <18> 21.7021, <19> 23.5047, <20> 19.6017;
param workload[JOB] := <1> 5.4844, <2> 4.9861, <3> 5.0524, <4> 5.0632, <5> 5.3184, <6> 5.3062, <7> 5.4585, <8> 4.0233, <9> 4.5896, <10> 5.4332, <11> 6.2953, <12> 4.5008, <13> 5.697, <14> 5.1947, <15> 4.9327, <16> 5.5779, <17> 4.9469, <18> 4.6586, <19> 4.8482, <20> 4.4274;
param capacity[MACHINE] := <1> 101.7948, <2> 101.7948, <3> 101.7948, <4> 101.7948, <5> 101.7948, <6> 101.7948, <7> 101.7948;

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

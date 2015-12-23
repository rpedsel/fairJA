set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.5499, <2> 23.1034, <3> 13.6333, <4> 12.4651, <5> 14.88, <6> 21.3007, <7> 28.5863, <8> 21.1342, <9> 21.6779, <10> 30.8816, <11> 21.5199, <12> 27.2594, <13> 21.1611, <14> 23.8613, <15> 40.8845, <16> 22.3427, <17> 36.6231, <18> 23.2263, <19> 20.0835, <20> 38.1112;
param workload[JOB] := <1> 49.9614, <2> 15.4893, <3> 49.7017, <4> 14.5964, <5> 29.372, <6> 32.3762, <7> 15.6728, <8> 25.718, <9> 34.6219, <10> 42.7096, <11> 9.2413, <12> 45.341, <13> 0.3701, <14> 37.5149, <15> 8.9517, <16> 23.733, <17> 9.2689, <18> 29.5753, <19> 45.1747, <20> 32.215;
param capacity[MACHINE] := <1> 78.8007, <2> 78.8007, <3> 78.8007, <4> 78.8007, <5> 78.8007, <6> 78.8007, <7> 78.8007;

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

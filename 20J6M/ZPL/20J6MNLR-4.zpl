set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.0858, <2> 17.3445, <3> 25.4143, <4> 21.3561, <5> 33.8157, <6> 22.8193, <7> 30.5775, <8> 25.0107, <9> 23.9753, <10> 20.6656, <11> 21.5169, <12> 23.4845, <13> 27.3795, <14> 34.1584, <15> 19.6649, <16> 23.9154, <17> 20.6489, <18> 19.3953, <19> 26.8042, <20> 21.6159;
param workload[JOB] := <1> 36.5565, <2> 34.7543, <3> 47.5023, <4> 38.0013, <5> 25.5527, <6> 20.8599, <7> 31.1543, <8> 44.6492, <9> 34.4998, <10> 38.1834, <11> 33.7905, <12> 21.9807, <13> 14.2319, <14> 23.3163, <15> 2.2849, <16> 2.1856, <17> 45.2905, <18> 15.8482, <19> 36.294, <20> 29.536;
param capacity[MACHINE] := <1> 96.0787, <2> 96.0787, <3> 96.0787, <4> 96.0787, <5> 96.0787, <6> 96.0787;

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

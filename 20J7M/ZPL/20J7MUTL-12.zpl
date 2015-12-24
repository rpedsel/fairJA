set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 0.9291, <2> 13.7976, <3> 3.7846, <4> 41.9525, <5> 13.3344, <6> 49.5657, <7> 33.4769, <8> 5.615, <9> 2.8111, <10> 45.8956, <11> 25.4643, <12> 1.4564, <13> 22.9639, <14> 10.463, <15> 42.7447, <16> 15.0326, <17> 17.86, <18> 41.4657, <19> 4.911, <20> 28.4067;
param workload[JOB] := <1> 0.9291, <2> 13.7976, <3> 3.7846, <4> 41.9525, <5> 13.3344, <6> 49.5657, <7> 33.4769, <8> 5.615, <9> 2.8111, <10> 45.8956, <11> 25.4643, <12> 1.4564, <13> 22.9639, <14> 10.463, <15> 42.7447, <16> 15.0326, <17> 17.86, <18> 41.4657, <19> 4.911, <20> 28.4067;
param capacity[MACHINE] := <1> 53.1509, <2> 53.1509, <3> 53.1509, <4> 53.1509, <5> 53.1509, <6> 53.1509, <7> 53.1509;

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

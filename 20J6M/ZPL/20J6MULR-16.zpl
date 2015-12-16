set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 7.2281, <2> 26.6106, <3> 4.3227, <4> 41.9364, <5> 3.736, <6> 45.5353, <7> 33.3854, <8> 49.835, <9> 14.0483, <10> 39.7666, <11> 19.592, <12> 2.2492, <13> 10.3492, <14> 26.0289, <15> 15.7369, <16> 37.1635, <17> 25.3905, <18> 2.0988, <19> 10.8986, <20> 26.9048;
param workload[JOB] := <1> 17.6419, <2> 18.2903, <3> 11.672, <4> 2.0001, <5> 20.6936, <6> 13.8652, <7> 27.9644, <8> 13.7088, <9> 22.872, <10> 26.0188, <11> 27.245, <12> 5.7869, <13> 42.9922, <14> 34.7961, <15> 39.5175, <16> 23.0485, <17> 9.7186, <18> 47.3289, <19> 34.1881, <20> 21.0544;
param capacity[MACHINE] := <1> 76.7339, <2> 76.7339, <3> 76.7339, <4> 76.7339, <5> 76.7339, <6> 76.7339;

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

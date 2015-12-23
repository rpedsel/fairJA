set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.228, <2> 4.9759, <3> 47.4897, <4> 29.7176, <5> 19.8924, <6> 38.4862, <7> 25.6246, <8> 3.9946, <9> 29.3419, <10> 1.7685, <11> 6.618, <12> 0.9488, <13> 13.8853, <14> 0.6342, <15> 6.6642, <16> 49.7468, <17> 10.32, <18> 10.4869, <19> 28.7705, <20> 28.034;
param workload[JOB] := <1> 24.4214, <2> 14.4844, <3> 47.1422, <4> 9.7329, <5> 35.6576, <6> 17.1342, <7> 16.5804, <8> 11.3932, <9> 19.1583, <10> 19.7347, <11> 42.3965, <12> 24.9322, <13> 24.3415, <14> 25.8198, <15> 9.4685, <16> 24.5287, <17> 31.2077, <18> 2.2575, <19> 37.223, <20> 24.7824;
param capacity[MACHINE] := <1> 66.0567, <2> 66.0567, <3> 66.0567, <4> 66.0567, <5> 66.0567, <6> 66.0567, <7> 66.0567;

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

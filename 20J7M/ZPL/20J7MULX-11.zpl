set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.7521, <2> 37.0529, <3> 0.2914, <4> 33.4075, <5> 3.9931, <6> 17.5203, <7> 11.8993, <8> 49.6205, <9> 25.7198, <10> 48.9811, <11> 9.5105, <12> 2.2986, <13> 18.1881, <14> 38.3347, <15> 43.5233, <16> 44.3919, <17> 13.6878, <18> 45.4003, <19> 19.8889, <20> 6.8749;
param workload[JOB] := <1> 4.7699, <2> 6.0871, <3> 0.5398, <4> 5.7799, <5> 1.9983, <6> 4.1857, <7> 3.4495, <8> 7.0442, <9> 5.0715, <10> 6.9986, <11> 3.0839, <12> 1.5161, <13> 4.2648, <14> 6.1915, <15> 6.5972, <16> 6.6627, <17> 3.6997, <18> 6.738, <19> 4.4597, <20> 2.622;
param capacity[MACHINE] := <1> 13.1086, <2> 13.1086, <3> 13.1086, <4> 13.1086, <5> 13.1086, <6> 13.1086, <7> 13.1086;

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

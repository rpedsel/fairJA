set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.9265, <2> 23.5825, <3> 31.6, <4> 25.0205, <5> 30.9526, <6> 25.5111, <7> 25.9241, <8> 23.3487, <9> 23.5173, <10> 24.262, <11> 23.1907, <12> 32.5105, <13> 21.7211, <14> 24.5496, <15> 23.309, <16> 20.7604, <17> 25.5853, <18> 15.9011, <19> 14.8883, <20> 34.8559;
param workload[JOB] := <1> 49.8335, <2> 10.2738, <3> 40.4765, <4> 15.3855, <5> 3.1624, <6> 17.7602, <7> 25.3802, <8> 11.2729, <9> 31.2862, <10> 10.7621, <11> 38.5883, <12> 45.2802, <13> 40.5924, <14> 38.5154, <15> 27.9794, <16> 49.4755, <17> 19.7553, <18> 21.3242, <19> 13.7337, <20> 33.0661;
param capacity[MACHINE] := <1> 90.6506, <2> 90.6506, <3> 90.6506, <4> 90.6506, <5> 90.6506, <6> 90.6506;

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

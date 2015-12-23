set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.2001, <2> 18.2536, <3> 1.9958, <4> 35.6745, <5> 48.1093, <6> 30.3252, <7> 10.8879, <8> 9.6581, <9> 16.2103, <10> 39.8085, <11> 23.1881, <12> 38.2823, <13> 19.262, <14> 26.9361, <15> 36.6291, <16> 5.0873, <17> 37.0432, <18> 32.3274, <19> 8.1756, <20> 44.0372;
param workload[JOB] := <1> 8.5789, <2> 3.754, <3> 3.3059, <4> 0.78, <5> 42.2694, <6> 36.3048, <7> 45.1677, <8> 3.9443, <9> 36.8752, <10> 5.4647, <11> 5.3934, <12> 43.7425, <13> 47.9394, <14> 8.0872, <15> 38.5181, <16> 36.3462, <17> 18.9022, <18> 31.945, <19> 14.8549, <20> 41.2285;
param capacity[MACHINE] := <1> 473.4023, <2> 473.4023, <3> 473.4023, <4> 473.4023, <5> 473.4023, <6> 473.4023, <7> 473.4023;

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

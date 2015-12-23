set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 3.6612, <2> 4.7, <3> 40.2938, <4> 48.2036, <5> 15.2045, <6> 19.0326, <7> 30.413, <8> 24.5557, <9> 37.8389, <10> 46.7495, <11> 4.2436, <12> 29.231, <13> 44.5801, <14> 20.4209, <15> 20.9526, <16> 23.295, <17> 28.4463, <18> 31.3987, <19> 45.8603, <20> 0.9306;
param workload[JOB] := <1> 20.6514, <2> 14.7787, <3> 48.613, <4> 21.6365, <5> 1.0102, <6> 12.5243, <7> 13.2231, <8> 35.3857, <9> 5.6798, <10> 14.4193, <11> 13.6476, <12> 39.5237, <13> 32.9978, <14> 37.2717, <15> 49.6104, <16> 47.4869, <17> 41.204, <18> 21.2454, <19> 39.5632, <20> 21.2351;
param capacity[MACHINE] := <1> 75.9583, <2> 75.9583, <3> 75.9583, <4> 75.9583, <5> 75.9583, <6> 75.9583, <7> 75.9583;

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

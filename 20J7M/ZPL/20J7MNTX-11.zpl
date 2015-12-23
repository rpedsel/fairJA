set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.3759, <2> 32.2761, <3> 36.5435, <4> 30.8494, <5> 20.1305, <6> 24.3034, <7> 29.284, <8> 25.33, <9> 28.1562, <10> 22.7486, <11> 25.8709, <12> 26.0946, <13> 22.9363, <14> 22.5674, <15> 23.3056, <16> 25.9156, <17> 24.427, <18> 27.0783, <19> 22.0816, <20> 35.6098;
param workload[JOB] := <1> 5.0374, <2> 5.6812, <3> 6.0451, <4> 5.5542, <5> 4.4867, <6> 4.9298, <7> 5.4115, <8> 5.0329, <9> 5.3062, <10> 4.7695, <11> 5.0863, <12> 5.1083, <13> 4.7892, <14> 4.7505, <15> 4.8276, <16> 5.0907, <17> 4.9424, <18> 5.2037, <19> 4.6991, <20> 5.9674;
param capacity[MACHINE] := <1> 11.0057, <2> 11.0057, <3> 11.0057, <4> 11.0057, <5> 11.0057, <6> 11.0057, <7> 11.0057;

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

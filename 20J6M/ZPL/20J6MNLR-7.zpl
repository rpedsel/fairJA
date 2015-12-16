set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.2258, <2> 19.4305, <3> 25.2172, <4> 30.1656, <5> 28.6145, <6> 20.5527, <7> 17.2775, <8> 30.1662, <9> 21.8629, <10> 33.9392, <11> 33.4462, <12> 28.0621, <13> 22.6757, <14> 25.6935, <15> 18.3502, <16> 22.5624, <17> 32.5971, <18> 25.7837, <19> 27.3835, <20> 27.3002;
param workload[JOB] := <1> 36.4352, <2> 14.941, <3> 13.6477, <4> 33.6391, <5> 38.7442, <6> 12.2188, <7> 21.5594, <8> 14.1974, <9> 39.7133, <10> 33.546, <11> 36.6979, <12> 21.0092, <13> 17.4072, <14> 5.0374, <15> 36.7745, <16> 11.2497, <17> 29.6056, <18> 30.8498, <19> 46.0942, <20> 17.993;
param capacity[MACHINE] := <1> 85.2268, <2> 85.2268, <3> 85.2268, <4> 85.2268, <5> 85.2268, <6> 85.2268;

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

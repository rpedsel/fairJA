set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 0.252, <2> 22.9404, <3> 10.2605, <4> 11.4331, <5> 21.3156, <6> 26.8503, <7> 22.2934, <8> 20.4136, <9> 2.0591, <10> 26.5438, <11> 39.8801, <12> 7.1459, <13> 21.2883, <14> 2.0752, <15> 8.4178, <16> 13.839, <17> 33.3689, <18> 20.5369, <19> 11.3777, <20> 45.2492;
param workload[JOB] := <1> 39.7334, <2> 8.2817, <3> 10.6649, <4> 39.1046, <5> 27.387, <6> 20.8601, <7> 49.7256, <8> 6.0858, <9> 1.4933, <10> 13.1228, <11> 27.9967, <12> 20.4298, <13> 3.4509, <14> 48.026, <15> 15.9341, <16> 32.2323, <17> 10.4244, <18> 30.205, <19> 2.2139, <20> 8.7522;
param capacity[MACHINE] := <1> 59.4464, <2> 59.4464, <3> 59.4464, <4> 59.4464, <5> 59.4464, <6> 59.4464, <7> 59.4464;

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

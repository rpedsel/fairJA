set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.4651, <2> 49.801, <3> 21.4971, <4> 7.4988, <5> 43.9119, <6> 36.5013, <7> 2.3947, <8> 43.882, <9> 22.5402, <10> 4.9082, <11> 15.4819, <12> 23.7724, <13> 24.6876, <14> 32.9275, <15> 33.408, <16> 19.3782, <17> 34.1579, <18> 40.1028, <19> 36.2451, <20> 20.8577;
param workload[JOB] := <1> 36.6751, <2> 14.7266, <3> 45.4401, <4> 33.135, <5> 26.991, <6> 18.2307, <7> 1.3993, <8> 36.3534, <9> 13.366, <10> 24.7028, <11> 11.4, <12> 7.9463, <13> 30.472, <14> 18.2102, <15> 30.2803, <16> 16.9998, <17> 32.9649, <18> 35.2217, <19> 31.7975, <20> 12.6215;
param capacity[MACHINE] := <1> 79.8224, <2> 79.8224, <3> 79.8224, <4> 79.8224, <5> 79.8224, <6> 79.8224;

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

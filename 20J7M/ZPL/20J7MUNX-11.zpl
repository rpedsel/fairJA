set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.3914, <2> 18.8315, <3> 47.1069, <4> 29.7209, <5> 32.9179, <6> 41.2174, <7> 44.491, <8> 29.5634, <9> 13.1363, <10> 31.028, <11> 21.0774, <12> 36.3422, <13> 0.4505, <14> 11.9646, <15> 1.9417, <16> 8.5315, <17> 33.37, <18> 13.642, <19> 47.126, <20> 6.7555;
param workload[JOB] := <1> 4.732, <2> 4.3395, <3> 6.8634, <4> 5.4517, <5> 5.7374, <6> 6.4201, <7> 6.6702, <8> 5.4372, <9> 3.6244, <10> 5.5703, <11> 4.591, <12> 6.0284, <13> 0.6712, <14> 3.459, <15> 1.3934, <16> 2.9209, <17> 5.7767, <18> 3.6935, <19> 6.8648, <20> 2.5991;
param capacity[MACHINE] := <1> 92.8442, <2> 92.8442, <3> 92.8442, <4> 92.8442, <5> 92.8442, <6> 92.8442, <7> 92.8442;

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

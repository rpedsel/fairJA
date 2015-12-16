set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 8.9104, <2> 18.1382, <3> 34.3455, <4> 20.9617, <5> 24.1007, <6> 0.5342, <7> 6.2598, <8> 22.5672, <9> 42.634, <10> 28.5383, <11> 27.6363, <12> 21.5032, <13> 14.9157, <14> 22.8038, <15> 0.173, <16> 22.2434, <17> 25.1293, <18> 46.9328, <19> 35.905, <20> 6.6088;
param workload[JOB] := <1> 2.985, <2> 4.2589, <3> 5.8605, <4> 4.5784, <5> 4.9092, <6> 0.7309, <7> 2.502, <8> 4.7505, <9> 6.5295, <10> 5.3421, <11> 5.257, <12> 4.6372, <13> 3.8621, <14> 4.7753, <15> 0.4159, <16> 4.7163, <17> 5.0129, <18> 6.8508, <19> 5.9921, <20> 2.5708;
param capacity[MACHINE] := <1> 14.4229, <2> 14.4229, <3> 14.4229, <4> 14.4229, <5> 14.4229, <6> 14.4229;

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

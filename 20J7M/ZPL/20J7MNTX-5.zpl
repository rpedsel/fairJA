set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.1052, <2> 30.3235, <3> 21.2016, <4> 23.6725, <5> 28.205, <6> 20.7735, <7> 21.8784, <8> 35.6578, <9> 21.4919, <10> 31.5204, <11> 25.3594, <12> 19.8633, <13> 27.209, <14> 26.2456, <15> 21.9687, <16> 26.7277, <17> 19.32, <18> 27.331, <19> 26.0029, <20> 24.0536;
param workload[JOB] := <1> 5.4868, <2> 5.5067, <3> 4.6045, <4> 4.8654, <5> 5.3108, <6> 4.5578, <7> 4.6774, <8> 5.9714, <9> 4.6359, <10> 5.6143, <11> 5.0358, <12> 4.4568, <13> 5.2162, <14> 5.123, <15> 4.6871, <16> 5.1699, <17> 4.3955, <18> 5.2279, <19> 5.0993, <20> 4.9044;
param capacity[MACHINE] := <1> 10.7729, <2> 10.7729, <3> 10.7729, <4> 10.7729, <5> 10.7729, <6> 10.7729, <7> 10.7729;

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

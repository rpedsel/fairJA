set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.7496, <2> 30.9672, <3> 28.3134, <4> 20.3443, <5> 23.2567, <6> 17.6725, <7> 34.0031, <8> 20.2881, <9> 20.2083, <10> 17.3738, <11> 32.2544, <12> 14.5881, <13> 23.712, <14> 30.3853, <15> 23.3257, <16> 25.5835, <17> 34.2332, <18> 22.5083, <19> 28.7228, <20> 29.2537;
param workload[JOB] := <1> 564.0435, <2> 958.9675, <3> 801.6486, <4> 413.8905, <5> 540.8741, <6> 312.3173, <7> 1156.2108, <8> 411.607, <9> 408.3754, <10> 301.8489, <11> 1040.3463, <12> 212.8127, <13> 562.2589, <14> 923.2665, <15> 544.0883, <16> 654.5155, <17> 1171.912, <18> 506.6236, <19> 824.9992, <20> 855.779;
param capacity[MACHINE] := <1> 13166.3856, <2> 13166.3856, <3> 13166.3856, <4> 13166.3856, <5> 13166.3856, <6> 13166.3856, <7> 13166.3856;

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

set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.5781, <2> 40.0837, <3> 38.6979, <4> 14.65, <5> 48.934, <6> 29.1315, <7> 37.1236, <8> 13.0493, <9> 8.044, <10> 25.2811, <11> 49.0502, <12> 47.5178, <13> 22.068, <14> 26.2169, <15> 16.3865, <16> 45.1835, <17> 27.3113, <18> 42.2933, <19> 0.2889, <20> 8.3273;
param workload[JOB] := <1> 15.5781, <2> 40.0837, <3> 38.6979, <4> 14.65, <5> 48.934, <6> 29.1315, <7> 37.1236, <8> 13.0493, <9> 8.044, <10> 25.2811, <11> 49.0502, <12> 47.5178, <13> 22.068, <14> 26.2169, <15> 16.3865, <16> 45.1835, <17> 27.3113, <18> 42.2933, <19> 0.2889, <20> 8.3273;
param capacity[MACHINE] := <1> 555.2169, <2> 555.2169, <3> 555.2169, <4> 555.2169, <5> 555.2169, <6> 555.2169;

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

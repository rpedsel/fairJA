set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.4277, <2> 25.639, <3> 24.801, <4> 23.2296, <5> 20.4071, <6> 30.586, <7> 29.2945, <8> 26.9703, <9> 23.1414, <10> 26.7939, <11> 21.6133, <12> 21.1811, <13> 21.9835, <14> 25.5718, <15> 30.6385, <16> 27.4119, <17> 32.239, <18> 20.748, <19> 22.6686, <20> 14.1283;
param workload[JOB] := <1> 4.5197, <2> 5.0635, <3> 4.9801, <4> 4.8197, <5> 4.5174, <6> 5.5305, <7> 5.4124, <8> 5.1933, <9> 4.8106, <10> 5.1763, <11> 4.649, <12> 4.6023, <13> 4.6887, <14> 5.0569, <15> 5.5352, <16> 5.2356, <17> 5.6779, <18> 4.555, <19> 4.7612, <20> 3.7588;
param capacity[MACHINE] := <1> 12.318, <2> 12.318, <3> 12.318, <4> 12.318, <5> 12.318, <6> 12.318;

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

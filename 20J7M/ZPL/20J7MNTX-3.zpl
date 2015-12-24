set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.4206, <2> 16.5506, <3> 23.2528, <4> 29.0999, <5> 29.6163, <6> 20.377, <7> 33.1384, <8> 31.5094, <9> 19.6392, <10> 20.6481, <11> 8.2752, <12> 18.2183, <13> 27.1732, <14> 21.9507, <15> 19.1993, <16> 24.6901, <17> 26.2676, <18> 22.2841, <19> 28.2982, <20> 22.7842;
param workload[JOB] := <1> 4.4069, <2> 4.0682, <3> 4.8221, <4> 5.3944, <5> 5.4421, <6> 4.5141, <7> 5.7566, <8> 5.6133, <9> 4.4316, <10> 4.544, <11> 2.8767, <12> 4.2683, <13> 5.2128, <14> 4.6852, <15> 4.3817, <16> 4.9689, <17> 5.1252, <18> 4.7206, <19> 5.3196, <20> 4.7733;
param capacity[MACHINE] := <1> 10.2134, <2> 10.2134, <3> 10.2134, <4> 10.2134, <5> 10.2134, <6> 10.2134, <7> 10.2134;

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

set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.67, <2> 25.1025, <3> 28.9295, <4> 27.9975, <5> 14.1678, <6> 21.7634, <7> 24.0161, <8> 26.6416, <9> 26.564, <10> 19.4026, <11> 20.6104, <12> 19.5099, <13> 34.8663, <14> 23.0407, <15> 23.2076, <16> 34.3566, <17> 27.1464, <18> 22.9424, <19> 27.4514, <20> 15.3125;
param workload[JOB] := <1> 4.8652, <2> 5.0102, <3> 5.3786, <4> 5.2913, <5> 3.764, <6> 4.6651, <7> 4.9006, <8> 5.1616, <9> 5.154, <10> 4.4048, <11> 4.5399, <12> 4.417, <13> 5.9048, <14> 4.8001, <15> 4.8174, <16> 5.8615, <17> 5.2102, <18> 4.7898, <19> 5.2394, <20> 3.9131;
param capacity[MACHINE] := <1> 98.0886, <2> 98.0886, <3> 98.0886, <4> 98.0886, <5> 98.0886, <6> 98.0886, <7> 98.0886;

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

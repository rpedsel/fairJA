set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.229, <2> 22.2745, <3> 19.4235, <4> 25.399, <5> 25.1471, <6> 19.6406, <7> 29.6883, <8> 26.9763, <9> 26.6326, <10> 31.026, <11> 20.3424, <12> 23.84, <13> 18.0874, <14> 21.2729, <15> 27.3733, <16> 28.0346, <17> 23.681, <18> 23.3042, <19> 19.1769, <20> 18.3101;
param workload[JOB] := <1> 27.229, <2> 22.2745, <3> 19.4235, <4> 25.399, <5> 25.1471, <6> 19.6406, <7> 29.6883, <8> 26.9763, <9> 26.6326, <10> 31.026, <11> 20.3424, <12> 23.84, <13> 18.0874, <14> 21.2729, <15> 27.3733, <16> 28.0346, <17> 23.681, <18> 23.3042, <19> 19.1769, <20> 18.3101;
param capacity[MACHINE] := <1> 51.0921, <2> 51.0921, <3> 51.0921, <4> 51.0921, <5> 51.0921, <6> 51.0921, <7> 51.0921;

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

set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 43.8578, <2> 8.4451, <3> 13.0023, <4> 1.9418, <5> 6.5466, <6> 2.9879, <7> 44.4298, <8> 9.9317, <9> 35.8283, <10> 4.2201;
param workload[JOB] := <1> 1923.5066, <2> 71.3197, <3> 169.0598, <4> 3.7706, <5> 42.858, <6> 8.9275, <7> 1974.0071, <8> 98.6387, <9> 1283.6671, <10> 17.8092;
param capacity[MACHINE] := <1> 2511.2485, <2> 2511.2485, <3> 2511.2485;

var x[JM] binary;
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

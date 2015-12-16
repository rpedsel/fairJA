set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.8836, <2> 7.671, <3> 13.853, <4> 8.1957, <5> 13.6329, <6> 39.0798, <7> 48.742, <8> 25.6298, <9> 42.8456, <10> 12.3684, <11> 4.4205, <12> 7.8051, <13> 49.0264, <14> 36.2408, <15> 38.898, <16> 31.2636, <17> 42.2243, <18> 20.9727, <19> 20.6886, <20> 45.2744;
param workload[JOB] := <1> 33.8836, <2> 7.671, <3> 13.853, <4> 8.1957, <5> 13.6329, <6> 39.0798, <7> 48.742, <8> 25.6298, <9> 42.8456, <10> 12.3684, <11> 4.4205, <12> 7.8051, <13> 49.0264, <14> 36.2408, <15> 38.898, <16> 31.2636, <17> 42.2243, <18> 20.9727, <19> 20.6886, <20> 45.2744;
param capacity[MACHINE] := <1> 542.7162, <2> 542.7162, <3> 542.7162, <4> 542.7162, <5> 542.7162, <6> 542.7162;

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

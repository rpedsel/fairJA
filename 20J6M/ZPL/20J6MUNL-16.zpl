set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.1551, <2> 10.5905, <3> 1.4538, <4> 18.7235, <5> 41.39, <6> 22.752, <7> 28.5093, <8> 35.2013, <9> 29.8075, <10> 11.4778, <11> 26.7586, <12> 33.4443, <13> 26.2251, <14> 13.0893, <15> 22.9005, <16> 22.014, <17> 27.6025, <18> 21.5597, <19> 9.6127, <20> 18.72;
param workload[JOB] := <1> 33.1551, <2> 10.5905, <3> 1.4538, <4> 18.7235, <5> 41.39, <6> 22.752, <7> 28.5093, <8> 35.2013, <9> 29.8075, <10> 11.4778, <11> 26.7586, <12> 33.4443, <13> 26.2251, <14> 13.0893, <15> 22.9005, <16> 22.014, <17> 27.6025, <18> 21.5597, <19> 9.6127, <20> 18.72;
param capacity[MACHINE] := <1> 454.9875, <2> 454.9875, <3> 454.9875, <4> 454.9875, <5> 454.9875, <6> 454.9875;

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

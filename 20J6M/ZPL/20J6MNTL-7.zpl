set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.3636, <2> 28.5125, <3> 25.8323, <4> 15.1898, <5> 23.1867, <6> 25.671, <7> 21.8416, <8> 20.4712, <9> 27.4651, <10> 29.7682, <11> 24.3798, <12> 26.2034, <13> 26.268, <14> 22.1557, <15> 18.9752, <16> 23.6729, <17> 27.9801, <18> 26.9381, <19> 30.9746, <20> 28.262;
param workload[JOB] := <1> 22.3636, <2> 28.5125, <3> 25.8323, <4> 15.1898, <5> 23.1867, <6> 25.671, <7> 21.8416, <8> 20.4712, <9> 27.4651, <10> 29.7682, <11> 24.3798, <12> 26.2034, <13> 26.268, <14> 22.1557, <15> 18.9752, <16> 23.6729, <17> 27.9801, <18> 26.9381, <19> 30.9746, <20> 28.262;
param capacity[MACHINE] := <1> 62.014, <2> 62.014, <3> 62.014, <4> 62.014, <5> 62.014, <6> 62.014;

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

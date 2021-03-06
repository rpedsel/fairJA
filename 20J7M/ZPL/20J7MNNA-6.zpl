set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.234, <2> 28.4181, <3> 20.6125, <4> 19.2226, <5> 22.329, <6> 29.1848, <7> 32.1516, <8> 27.9316, <9> 28.0042, <10> 34.4842, <11> 20.6297, <12> 28.4387, <13> 32.5958, <14> 13.5138, <15> 15.9097, <16> 23.5682, <17> 29.0794, <18> 27.6445, <19> 24.2345, <20> 16.7117;
param workload[JOB] := <1> 297.0108, <2> 807.5884, <3> 424.8752, <4> 369.5084, <5> 498.5842, <6> 851.7526, <7> 1033.7254, <8> 780.1743, <9> 784.2352, <10> 1189.16, <11> 425.5845, <12> 808.7597, <13> 1062.4862, <14> 182.6228, <15> 253.1186, <16> 555.4601, <17> 845.6115, <18> 764.2184, <19> 587.311, <20> 279.2809;
param capacity[MACHINE] := <1> 12801.0682, <2> 12801.0682, <3> 12801.0682, <4> 12801.0682, <5> 12801.0682, <6> 12801.0682, <7> 12801.0682;

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

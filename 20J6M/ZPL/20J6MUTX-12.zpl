set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.1974, <2> 20.0753, <3> 11.1275, <4> 42.9263, <5> 13.0144, <6> 41.9168, <7> 11.2056, <8> 23.9398, <9> 20.4996, <10> 6.7903, <11> 24.4885, <12> 27.4025, <13> 31.7303, <14> 2.478, <15> 27.2006, <16> 7.0997, <17> 8.0543, <18> 44.7284, <19> 5.1599, <20> 31.8949;
param workload[JOB] := <1> 5.9327, <2> 4.4805, <3> 3.3358, <4> 6.5518, <5> 3.6075, <6> 6.4743, <7> 3.3475, <8> 4.8928, <9> 4.5276, <10> 2.6058, <11> 4.9486, <12> 5.2347, <13> 5.633, <14> 1.5742, <15> 5.2154, <16> 2.6645, <17> 2.838, <18> 6.6879, <19> 2.2715, <20> 5.6476;
param capacity[MACHINE] := <1> 11.059, <2> 11.059, <3> 11.059, <4> 11.059, <5> 11.059, <6> 11.059;

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

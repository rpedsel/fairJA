set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 12.1776, <2> 22.5547, <3> 24.6204, <4> 30.0739, <5> 19.1243, <6> 27.6216, <7> 28.1961, <8> 27.8345, <9> 29.4898, <10> 14.5163, <11> 26.2042, <12> 32.3873, <13> 26.6607, <14> 17.0698, <15> 25.7184, <16> 22.7276, <17> 33.2391, <18> 36.2778, <19> 13.8195, <20> 25.0256;
param workload[JOB] := <1> 148.2939, <2> 508.7145, <3> 606.1641, <4> 904.4395, <5> 365.7389, <6> 762.9528, <7> 795.0201, <8> 774.7594, <9> 869.6483, <10> 210.723, <11> 686.6601, <12> 1048.9372, <13> 710.7929, <14> 291.3781, <15> 661.4361, <16> 516.5438, <17> 1104.8378, <18> 1316.0788, <19> 190.9786, <20> 626.2807;
param capacity[MACHINE] := <1> 2183.3964, <2> 2183.3964, <3> 2183.3964, <4> 2183.3964, <5> 2183.3964, <6> 2183.3964;

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

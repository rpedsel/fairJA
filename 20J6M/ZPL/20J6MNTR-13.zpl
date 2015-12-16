set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.945, <2> 25.0229, <3> 30.5186, <4> 30.3081, <5> 23.2583, <6> 33.1706, <7> 19.0074, <8> 21.5387, <9> 29.9187, <10> 24.8859, <11> 24.7528, <12> 27.0723, <13> 25.5858, <14> 21.1991, <15> 23.5124, <16> 15.8642, <17> 28.4166, <18> 29.2573, <19> 29.2822, <20> 30.7859;
param workload[JOB] := <1> 35.6721, <2> 11.9994, <3> 14.5874, <4> 1.6791, <5> 33.7467, <6> 33.3052, <7> 9.8251, <8> 27.313, <9> 44.056, <10> 5.1922, <11> 33.7646, <12> 27.6312, <13> 49.1804, <14> 4.8491, <15> 13.8612, <16> 14.2258, <17> 5.5895, <18> 38.6665, <19> 45.5095, <20> 6.0404;
param capacity[MACHINE] := <1> 57.0868, <2> 57.0868, <3> 57.0868, <4> 57.0868, <5> 57.0868, <6> 57.0868;

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

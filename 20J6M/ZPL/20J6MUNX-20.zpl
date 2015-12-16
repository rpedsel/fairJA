set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 1.8686, <2> 5.6165, <3> 35.6385, <4> 32.213, <5> 1.1848, <6> 9.7063, <7> 16.7644, <8> 22.0149, <9> 5.3098, <10> 5.7647, <11> 15.7188, <12> 7.2929, <13> 31.9724, <14> 45.9419, <15> 21.3715, <16> 25.4914, <17> 27.7197, <18> 36.7422, <19> 4.8509, <20> 12.002;
param workload[JOB] := <1> 1.367, <2> 2.3699, <3> 5.9698, <4> 5.6756, <5> 1.0885, <6> 3.1155, <7> 4.0944, <8> 4.692, <9> 2.3043, <10> 2.401, <11> 3.9647, <12> 2.7005, <13> 5.6544, <14> 6.778, <15> 4.6229, <16> 5.0489, <17> 5.265, <18> 6.0615, <19> 2.2025, <20> 3.4644;
param capacity[MACHINE] := <1> 78.8408, <2> 78.8408, <3> 78.8408, <4> 78.8408, <5> 78.8408, <6> 78.8408;

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

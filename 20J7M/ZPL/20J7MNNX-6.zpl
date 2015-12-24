set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.4304, <2> 21.605, <3> 30.9527, <4> 20.4532, <5> 21.2662, <6> 20.7331, <7> 16.9008, <8> 29.2952, <9> 29.3041, <10> 26.5682, <11> 19.6469, <12> 19.3385, <13> 24.7305, <14> 28.2567, <15> 25.6591, <16> 29.9546, <17> 28.921, <18> 19.0066, <19> 33.391, <20> 22.1887;
param workload[JOB] := <1> 4.408, <2> 4.6481, <3> 5.5635, <4> 4.5225, <5> 4.6115, <6> 4.5534, <7> 4.1111, <8> 5.4125, <9> 5.4133, <10> 5.1544, <11> 4.4325, <12> 4.3976, <13> 4.973, <14> 5.3157, <15> 5.0655, <16> 5.4731, <17> 5.3778, <18> 4.3597, <19> 5.7785, <20> 4.7105;
param capacity[MACHINE] := <1> 98.2822, <2> 98.2822, <3> 98.2822, <4> 98.2822, <5> 98.2822, <6> 98.2822, <7> 98.2822;

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

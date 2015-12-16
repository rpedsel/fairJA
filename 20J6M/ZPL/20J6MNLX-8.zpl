set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.6203, <2> 21.0208, <3> 37.6873, <4> 13.2304, <5> 21.0512, <6> 30.5095, <7> 24.1727, <8> 16.4015, <9> 16.6177, <10> 20.4046, <11> 30.4545, <12> 21.5873, <13> 27.7301, <14> 22.3719, <15> 24.5856, <16> 24.683, <17> 28.4007, <18> 29.0907, <19> 20.8243, <20> 23.0732;
param workload[JOB] := <1> 5.1595, <2> 4.5848, <3> 6.139, <4> 3.6374, <5> 4.5882, <6> 5.5235, <7> 4.9166, <8> 4.0499, <9> 4.0765, <10> 4.5171, <11> 5.5186, <12> 4.6462, <13> 5.2659, <14> 4.7299, <15> 4.9584, <16> 4.9682, <17> 5.3292, <18> 5.3936, <19> 4.5634, <20> 4.8035;
param capacity[MACHINE] := <1> 16.2282, <2> 16.2282, <3> 16.2282, <4> 16.2282, <5> 16.2282, <6> 16.2282;

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

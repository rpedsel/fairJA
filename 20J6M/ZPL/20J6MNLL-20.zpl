set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.0467, <2> 24.2296, <3> 22.5716, <4> 26.3743, <5> 28.4392, <6> 21.6938, <7> 24.1313, <8> 18.9807, <9> 25.1755, <10> 22.1829, <11> 21.9178, <12> 21.2619, <13> 21.4246, <14> 13.2567, <15> 17.4784, <16> 20.1926, <17> 24.7149, <18> 19.3482, <19> 34.2652, <20> 18.2242;
param workload[JOB] := <1> 20.0467, <2> 24.2296, <3> 22.5716, <4> 26.3743, <5> 28.4392, <6> 21.6938, <7> 24.1313, <8> 18.9807, <9> 25.1755, <10> 22.1829, <11> 21.9178, <12> 21.2619, <13> 21.4246, <14> 13.2567, <15> 17.4784, <16> 20.1926, <17> 24.7149, <18> 19.3482, <19> 34.2652, <20> 18.2242;
param capacity[MACHINE] := <1> 74.3184, <2> 74.3184, <3> 74.3184, <4> 74.3184, <5> 74.3184, <6> 74.3184;

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

set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.0846, <2> 26.9491, <3> 18.976, <4> 15.7508, <5> 30.5709, <6> 22.9703, <7> 20.5941, <8> 27.7436, <9> 15.3941, <10> 31.7792, <11> 27.9267, <12> 25.1815, <13> 23.257, <14> 19.4499, <15> 22.7206, <16> 23.0374, <17> 30.0044, <18> 20.4714, <19> 28.8256, <20> 29.2552;
param workload[JOB] := <1> 4.3686, <2> 5.1913, <3> 4.3561, <4> 3.9687, <5> 5.5291, <6> 4.7927, <7> 4.5381, <8> 5.2672, <9> 3.9235, <10> 5.6373, <11> 5.2846, <12> 5.0181, <13> 4.8226, <14> 4.4102, <15> 4.7666, <16> 4.7997, <17> 5.4776, <18> 4.5245, <19> 5.3689, <20> 5.4088;
param capacity[MACHINE] := <1> 13.922, <2> 13.922, <3> 13.922, <4> 13.922, <5> 13.922, <6> 13.922, <7> 13.922;

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

set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.7735, <2> 27.278, <3> 20.5117, <4> 15.9336, <5> 26.1662, <6> 28.4391, <7> 24.1414, <8> 22.7741, <9> 27.8681, <10> 26.1263, <11> 22.9829, <12> 20.0187, <13> 18.7306, <14> 21.4553, <15> 30.6728, <16> 22.2827, <17> 29.2864, <18> 19.2333, <19> 31.825, <20> 17.588;
param workload[JOB] := <1> 474.0853, <2> 744.0893, <3> 420.7298, <4> 253.8796, <5> 684.67, <6> 808.7824, <7> 582.8072, <8> 518.6596, <9> 776.631, <10> 682.5836, <11> 528.2137, <12> 400.7483, <13> 350.8354, <14> 460.3299, <15> 940.8207, <16> 496.5187, <17> 857.6932, <18> 369.9198, <19> 1012.8306, <20> 309.3377;
param capacity[MACHINE] := <1> 1667.738, <2> 1667.738, <3> 1667.738, <4> 1667.738, <5> 1667.738, <6> 1667.738, <7> 1667.738;

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

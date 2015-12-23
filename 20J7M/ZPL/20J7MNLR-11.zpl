set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.511, <2> 30.0375, <3> 24.9629, <4> 35.466, <5> 15.116, <6> 23.4173, <7> 27.9431, <8> 23.0973, <9> 27.5719, <10> 23.3975, <11> 23.818, <12> 21.1738, <13> 24.509, <14> 24.3985, <15> 21.9728, <16> 21.2931, <17> 24.9815, <18> 27.7221, <19> 21.5252, <20> 25.3847;
param workload[JOB] := <1> 13.1015, <2> 26.2184, <3> 19.1664, <4> 26.9109, <5> 15.4052, <6> 10.7088, <7> 3.4612, <8> 33.8596, <9> 26.209, <10> 14.3949, <11> 38.0938, <12> 41.5155, <13> 42.3655, <14> 38.8062, <15> 26.0069, <16> 2.1618, <17> 2.0192, <18> 21.7806, <19> 24.4278, <20> 45.271;
param capacity[MACHINE] := <1> 67.412, <2> 67.412, <3> 67.412, <4> 67.412, <5> 67.412, <6> 67.412, <7> 67.412;

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

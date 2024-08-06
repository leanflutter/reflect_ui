import { Meta, StoryObj } from "@storybook/react";
import { Checkbox } from "./Checkbox";

const meta = {
  title: "Widgets/Checkbox",
  component: Checkbox,
  parameters: {
    layout: "centered",
  },
  argTypes: {
    
  },
} satisfies Meta<typeof Checkbox>;

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  args: {},
};
